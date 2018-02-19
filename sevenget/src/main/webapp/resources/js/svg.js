/**
 * detect SVG support in browser
 *
 * @param {Function} callback for detecting SVG support
 * @return {Boolean} SVG supported
 *
 */
detectSVG.support = null;
function detectSVG(callback) {
  if (detectSVG.support === null) {
    var img = document.createElement("img")
      , onload = function () {
      detectSVG.support = true;
      if (typeof(callback) == "function") callback();
    };

    img.setAttribute("src", "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNzUiIGhlaWdodD0iMjc1Ij48L3N2Zz4%3D");
    if (img.complete) {
      img.style.visibility = "hidden";
      img.style.position = "absolute";
      document.body.appendChild(img);
      window.setTimeout(function() {
        detectSVG.support = false;
        document.body.removeChild(img);
        if (img.width >= 100) onload();
      }, 1);
    } else {
      detectSVG.support = false;
      img.onload = onload;
    }
  } else if (detectSVG.support && typeof(callback) == "function") callback();

  return detectSVG.support;
}