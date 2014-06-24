$(document).ready(function(){
    $('.toggle-table').click(function(event){
        event.preventDefault();
        $(this).effect('highlight')
        $(this).closest('.report').find('table').toggle('slide')
    });

});