# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class App.ProductGroups extends App.Base

  index: ->
    $ ->
      $('#productGroupDataTable').dataTable
        ajax: '/product_groups'
        columns: [
          data: "id"
        ,
          data: "description"
        ]
        dom: 'B<"clear">lfrtip',
        #buttons: [ 'copy', 'csv', 'excel' ]
        buttons: true
        "scrollY": 300,
        "scrollX": true
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
