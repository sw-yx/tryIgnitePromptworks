var GetURL = function() {};
GetURL.prototype = {
run: function(arguments) {
  arguments.completionFunction({"URL": document.URL});
  console.log('hihihihihih', document.URL)
}
};
var ExtensionPreprocessingJS = new GetURL;
