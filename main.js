console.log('It works');

$(document).ready(function() {
    $('.submit').click(function (event) {
        console.log('Clicked Button');

        var name = $('.name').val()
        var email = $('.email').val()
        var message = $('.message').val()
        var statusElm = $('.status')
        statusElm.empty()

        if(email.length > 5 && email.includes('@') && email.includes('.')) {
            statusElm.append('<div>Email is valid</div>');
        } else {
        event.preventDefault()

            statusElm.append('<div>Email is NOT VALID</div>');
        }
        if(name.length > 2) {
            statusElm.append('<div>Name is valid</div>')
        } else {
        event.preventDefault()

            statusElm.append('<div>Name is NOT VALID, ENTER A LONGER NAME</div>')
        }
        if(message.length > 10 ) {
            statusElm.append('<div>Message is Valid</div>')
        } else {
        event.preventDefault()

            statusElm.append('<div>Message is TOO SHORT</div>')
        }
    })
})
