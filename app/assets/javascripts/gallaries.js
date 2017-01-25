var ready, set_positions;

set_positions = function(){
    $('.panel.panel-default').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){

    set_positions();

    $('.sortable').sortable();
    $( "sortable-placeholder" ).addClass( "col-md-4" );


    $('.sortable').on('sortupdate', function(e, ui) {
        updated_order = []
        set_positions();

        $('.panel.panel-default').each(function(i){
            updated_order.push({ id: $(this).data("id"), position: i+1 });
        });

        console.log(updated_order);
        // send the updated order via ajax
        $.ajax({
            type: "PUT",
            url: '/gallaries/sort',
            data: { order: updated_order }
        });
    });
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);