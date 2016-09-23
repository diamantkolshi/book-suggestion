// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require dropzone
//= require alertify


$(function() {
  var mediaDropzone = new Dropzone("#media-dropzone");
  Dropzone.options.mediaDropzone = false;
  mediaDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
  mediaDropzone.on("complete", function(files) {
    var _this = this;
    if (_this.getUploadingFiles().length === 0 && _this.getQueuedFiles().length === 0) {
      setTimeout(function(){
        $('#myModal').modal('hide');
        var acceptedFiles = _this.getAcceptedFiles();
        var rejectedFiles = _this.getRejectedFiles();

        for(var index = 0; index < acceptedFiles.length; index++) {
          var file = acceptedFiles[index];
          var response = JSON.parse(file.xhr.response);
          console.log(response);
          appendContent(response.url, response.image.id);
        }

        if(acceptedFiles.length != 0) {
          alertify.success('Fotografia eshte ngarkuar me sukses.');
        }
        if(rejectedFiles.length != 0) {
          alertify.error('Problem gjate ngarkimit ' + rejectedFiles.length + ' te fotografise.');
        }

        _this.removeAllFiles();

      }, 2000);
    }
  });
});

var appendContent = function(imageUrl, mediaId) {
  $("#media-contents").append('<div class="col-lg-4">' +
    '<div class="thumbnail"><img src="' + imageUrl + '"/>' +
    '<div class="caption">' +
    '<p><input type="checkbox" id="image_content_" name="image_content[]" value="' + mediaId +'"> përzgjedh</p>' +
    '</div>' +
    '</div></div>');
  $("#delete").removeAttr('disabled');
  $("#delete-all").removeAttr('disabled');
  $("#finish").removeAttr('disabled');
  $("#no-media").html("");
};




// $(function() {
//   var mediaDropzone = new Dropzone("#my-dropzone");
//   Dropzone.options.mediaDropzone = false;
//   mediaDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
//   addRemoveLinks: true
//   mediaDropzone.on("complete", function(files) {
//     var _this = this;
//     if (_this.getUploadingFiles().length === 0 && _this.getQueuedFiles().length === 0) {
//       setTimeout(function(){
//         $('#myModal').modal('hide');
//         var acceptedFiles = _this.getAcceptedFiles();
//         var rejectedFiles = _this.getRejectedFiles();

//         for(var index = 0; index < acceptedFiles.length; index++) {
//           var file = acceptedFiles[index];
//           var response = JSON.parse(file.xhr.response);
//           appendContent(response.file_name.url, response.id);
//         }

//         if(acceptedFiles.length != 0) {
//           alertify.success('Uploaded ' + acceptedFiles.length + ' files successfully.');
//         }
//         if(rejectedFiles.length != 0) {
//           alertify.error('Error uploading ' + rejectedFiles.length + ' files. Only image files are accepted.');
//         }

//         _this.removeAllFiles();

//       }, 2000);
//     }
//   });
// });

// $(document).ready(function(){
//   // disable auto discover
//   Dropzone.autoDiscover = false;

//   // grap our upload form by its id
//   $("#new_upload").dropzone({
//     // restrict image size to a maximum 1MB
//     maxFilesize: 1,
//     // changed the passed param to one accepted by
//     // our rails app
//     paramName: "upload[image]",
//     // show remove links on each image upload
//     addRemoveLinks: true,
//     // if the upload was successful
//     success: function(file, response){
//       // find the remove button link of the uploaded file and give it an id
//       // based of the fileID response from the server
//       $(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
//       // add the dz-success class (the green tick sign)
//       $(file.previewElement).addClass("dz-success");
//     },
//     //when the remove button is clicked
//     removedfile: function(file){
//       // grap the id of the uploaded file we set earlier
//       var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 

//       // make a DELETE ajax request to delete the file
//       $.ajax({
//         type: 'DELETE',
//         url: '/uploads/' + id,
//         success: function(data){
//           console.log(data.message);
//         }
//       });
//     }
//   }); 
// });


