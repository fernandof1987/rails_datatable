# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class App.Products extends App.Base

  index: ->
    $ ->
      $('#productDataTable').dataTable
        ajax: '/products'#Routes.products
        columns: [
          data: "id"
        ,
          data: "description"
        ,
          data: "subgroup"
        ,
          data: "cost_price"
        ,
          data: "sale_price"
        ,
          data: "created_at"
        ]
        dom: 'B<"clear">lfrtip'
        #buttons: true
        buttons: ['colvis', 'copy', 'excel', 'pdf', 'csv', 'print']
        "scrollY": 350
        "scrollX": true
        "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]]
        colReorder: true