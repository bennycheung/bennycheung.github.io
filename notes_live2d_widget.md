# Live2D Widget
* Archer Reilly, Gunicorn, <https://csrgxtu.github.io/2020/04/10/Gunicorn-an-inside-view-of-it/>
* Archer Reilly, Markdown Symbols, Example of using Live2D Widget, <https://csrgxtu.github.io/2015/03/20/Writing-Mathematic-Fomulars-in-Markdown/>
* Shuming Xu, Live2D in Electron – live2d-widget.js, Jan 2019, <https://shumingxu.com/posts/live2d-electron/>

Just add this to the page script,

```js
<script src="/live2dw/lib/L2Dwidget.min.js"></script>
<script>L2Dwidget.init({"model":{"scale":1,"hHeadPos":0.5,"vHeadPos":0.618,"jsonPath":"/live2dw/assets/hijiki.model.json"},"display":{"superSample":2,"width":150,"height":300,"position":"right","hOffset":0,"vOffset":-20},"mobile":{"show":true,"scale":0.5},"react":{"opacityDefault":0.7,"opacityOnHover":0.2},"log":false,"pluginJsPath":"lib/","pluginModelPath":"assets/","pluginRootPath":"live2dw/","tagMode":false});</script>
```
