function ajaxSubmit($this, url, callback) {

        var ajaxUrl =  url,
        data = $this.serialize();
        //alert('rrr');
        $.post(ajaxUrl, data, function(resultData) {
            //alert('kk');
            resultData['thisVar'] = $this;
            //alert('jjj');
            callBackFuction(callback, resultData);
            //$('body,html').animate({scrollTop: 0}, 'slow');
        }, 'json');
    }
    
    function callBackFuction(callback, data) {
        // Call our callback, but using our own instance as the context
        callback.call(this, data);
    }
    
    
    function dpAlert(boxTitle,alertMessaage,height){
        if(height==0){
            height=175;
        }
        $('#dialog-confirm-message-text').text(alertMessaage);
        //alert(alertMessaage);
        $( "#dialog-confirm" ).dialog({
            resizable: false,
            height:height,
            width:450,
            modal: true,
            title:boxTitle,
            dialogClass: 'success-dialog',
            buttons: {
                OK: function() {
                    $( this ).dialog( "close" );
                }
            }
        });//alert(alertMessaage);
    }
    
    function dpConfirm(boxTitle,confirmMessaage,actionUrlWithData,height){
        if(height==0){
            height=175;
        }
        $('#dialog-confirm-message-text').text(confirmMessaage);
        $( "#dialog-confirm" ).dialog({
            resizable: false,
            height:height,
            width:450,
            modal: true,
            title:boxTitle,
            dialogClass: 'success-dialog',
            buttons: {
                "OK": function() {
                    location.href=actionUrlWithData;
                },
                Cancel: function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }

function is_redirect(val){
    if(val==1)
        return true;
    else
        return false;
}

function newLetterFormCallback(resultData){
    $("#NewsLetterForm" ).prop( "disabled", false );
    if(resultData.result=='success'){
        $('#NewsLetterForm')[0].reset();
        dpAlert('Dailyplaza Alert',"Thanks for subscribing the news letter.",150);return false;
    }else{
        dpAlert('Dailyplaza Alert',resultData.msg,150);return false;
    }
}