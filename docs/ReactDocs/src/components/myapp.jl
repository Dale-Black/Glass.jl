using Glass

function Mybutton()
    return button(:class => "btn btn-primary", "I'm a button")
end

function Myapp()
    return divv(
                h1("Welcome to my app"),
                Mybutton()
            )
end

export Myapp