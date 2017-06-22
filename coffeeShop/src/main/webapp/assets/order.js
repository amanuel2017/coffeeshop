console.log("helooooo");
$("#addOrder").click(function(){
	
	console.log("amanuel");
    $.get("addOrder",
    {
        selProduct: $(".selProduct").val(),
        quantity: $(".quantity").val()
    },
    function(data, status){
        alert("Data: " + data + "\nStatus: " + status);
    });
});