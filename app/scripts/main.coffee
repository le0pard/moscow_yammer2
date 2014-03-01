# Listens for the app launching then creates the window
chrome.app.runtime.onLaunched.addListener ->
  width = 800
  height = 600
  chrome.app.window.create "index.html",
    id: "moscow_yammer"
    minWidth: width
    minHeight: height
    bounds:
      width: width
      height: height
      left: Math.round((screen.availWidth - width) / 2)
      top: Math.round((screen.availHeight - height) / 2)
