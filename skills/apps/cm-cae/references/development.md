# CAE FreeMarker Development

This note explains how FreeMarker template development works in the CAE modules of this workspace.

## 1) Rendering flow (request -> model -> template)

At runtime, CAE handlers return Spring `ModelAndView` objects. The `viewName` controls which template variant is rendered.

- `HandlerBase#doCreateModelWithView(...)` returns `HandlerHelper.createModelWithView(bean, viewName)`.
- `PreviewHandler` supports a `view` query parameter (`/preview?id=...&view=...`).
- `PageHandlerBase#addViewAndParameters(...)` appends `view` to generated links when set.

This is the key mechanism for selecting standard vs named template variants.

## 2) Where templates come from

Main CAE templates are in:

- `apps/cae/modules/cae/cae-base-lib/src/main/resources/META-INF/resources/WEB-INF/templates/common/...`
- `apps/cae/modules/cae/cae-base-lib/src/main/resources/META-INF/resources/WEB-INF/templates/error/...`

Frontend-built template resources are in:

- `frontend/target/resources`

Local CAE apps mount these workspace resources via:

- `apps/cae/spring-boot/cae-preview-app/src/main/resources/application-local.properties`
- `apps/cae/spring-boot/cae-live-app/src/main/resources/application-local.properties`

Look at `spring.boot.tomcat.extra-resources` and related `*.resources` properties. This gives fast edit/reload loops during development.

## 3) Template naming conventions

- Themes are located in the workspace under frontend/themes 

Common conventions visible in this workspace:

- `Type.ftl`: default view for a type (example: `Page.ftl`).
- `Type.asView.ftl`: named view variant (example: `Container.asGuidCookieLink.ftl`).
- `Type._fragment.ftl`: partials rendered via include view names (example: `Page._head.ftl`, `Page._body.ftl`).
- `Type.asView[variant].ftl`: variant-specific naming in frontend themes (example: `CMQueryList.asTeaser[left-right].ftl`).

A common pattern is:

```ftl
<@cm.include self=self view="_head"/>
```

which resolves to `Type._head.ftl` for the current model type.

## 4) Implicit imports and helper libraries

Base CAE implicit imports:

- `apps/cae/modules/cae/cae-base-lib/src/main/resources/freemarker_implicit.ftl`

Important aliases:

- `cm` -> `/lib/coremedia.com/cae.ftl`
- `preview` -> `/lib/coremedia.com/preview.ftl`
- `variants` -> `/lib/coremedia.com/variants.ftl`
- `bp` -> `/lib/coremedia.com/blueprint.ftl`
- `spring` -> `/spring.ftl`

Frontend also has a helper file for IDE completion:

- `frontend/src/main/resources/freemarker_implicit.ftl`

It adds aliases like `lc`, `es`, `am` and explicitly states it is a code completion helper.

## 5) Local development behavior (live vs preview)

Both local apps are configured for quick template reload:

- `spring.freemarker.settings.template_update_delay=1`

Ports and Solr collections differ:

- Preview: `server.port=40980`, `solr.cae.collection=preview`
- Live: `server.port=42180`, `solr.cae.collection=live`

Live also disables viewdispatcher cache in local profile:

- `cae.viewdispatcher.cache.enabled=false`

This helps when iterating on view/cache-key behavior.

## 6) ViewDispatcher behavior in CAE

In this workspace, the CAE view-dispatch behavior is mainly customized in:

- `apps/cae/modules/cae/cae-base-lib/src/main/java/com/coremedia/blueprint/cae/config/BlueprintViewsCaeBaseLibConfiguration.java`

### 6.1) Repository name resolution order

`BlueprintViewRepositoryNameProvider` builds the repository lookup list in this order:

1. Theme-derived repositories from `ThemeTemplateViewRepositoryProvider`
2. Navigation setting `viewRepositoryNames`
3. Common repositories configured in CAE (`error`, `common`)

The result is memoized per request in attribute `com.coremedia.blueprint.viewrepositorynames`.

### 6.2) Lookup traversal and viewtype fallback

`BlueprintViewLookupTraversal` replaces the default traversal and keeps repository-first lookup.

If a view lookup with a viewtype suffix fails (for example `asHeaderItem[search]`), it retries without `[search]`.
If only a viewtype was provided (for example `[search]`), the retry uses `null` as view name.

### 6.3) Template location patterns

CAE registers these template location patterns:

- Always: `/WEB-INF/templates/%s`
- Additionally (when `delivery.local-resources=false`):
  `jar:id:contentproperty:/Themes/%1$s/templates/%1$s-templates.jar/archive!/META-INF/resources/WEB-INF/templates/%1$s`

`ThemeTemplateViewRepositoryProvider` reads template-set jar entries under
`META-INF/resources/WEB-INF/templates/...` to discover repository names.

### 6.4) Theme repository name format

When local resources are disabled, theme-backed repositories are encoded as:

- `theme::1234/corporate` (no developer override)
- `theme:10:1234/corporate` (developer override)

When `delivery.local-resources=true` (local development), plain names like `corporate` are used.

### 6.5) Cache and invalidation behavior

- Theme repository names and template locations are cache-backed (`PairCacheKey`-based keys).
- If no cache is available, provider logs a warning and resolves uncached (ok for dev/test, slower for production).
- View lookup triggers include `CMTemplateSet` and `CMTheme`, so modifications can invalidate view cache state.

### 6.6) Development-relevant flags

- `cae.view.debug-enabled=true` enables extra view debug support in local/dev configs.
- `cae.viewdispatcher.cache.enabled=false` is set in local live config to force periodic reload of CAE view cache keys.
- `spring.freemarker.settings.template_update_delay=1` keeps template reload fast while iterating.

## 7) Practical development loop

1. Start CAE preview or live app with local profile.
2. Edit `.ftl` templates in `apps/cae/...` or frontend template sources.
3. Refresh the page after a short delay (template update delay is 1 second).
4. Use `view=...` in preview URLs to test specific named views quickly.
5. Verify includes/partials via `cm.include`-based view dispatch.

## 8) Run commands

From workspace root:

```bash
mvn spring-boot:run -pl :cae-preview-app -Dspring-boot.run.profiles=local
mvn spring-boot:run -pl :cae-live-app -Dspring-boot.run.profiles=local
```

Kubernetes-connected local preview example (documented in `global/deployment/kubernetes/QUICKSTART.adoc`):

```bash
mvn spring-boot:run -pl :cae-preview-app -Dspring-boot.run.profiles=local,dev,local-k8s
```

## 9) IDE support

For FreeMarker completion in this workspace, enable Maven profile `code-completion` (see `frontend/README.adoc`).

## 10) Official extension docs

`apps/cae/modules/extensions/README.md` points to the Blueprint Developer Manual for extension mechanism details. Use that as the canonical conceptual reference; this file focuses on workspace-local behavior and paths.

