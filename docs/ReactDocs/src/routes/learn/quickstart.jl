using Glass

include("../../components/myapp.jl")

function Quickstart()
    return html(
        head(
            meta(:charset => "UTF-8"),
            meta(:name => "viewport", :content => "width=device-width, initial-scale=1.0"),
            title("Glass.jl Documentation"),
            link(:href => "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css", :rel => "stylesheet"),
            link(:href => "https://cdn.jsdelivr.net/npm/daisyui/dist/full.css", :rel => "stylesheet")
        ),
        body(:class => "bg-neutral-100",
            nav(:class => "bg-primary py-4",
                divv(:class => "container mx-auto text-white flex justify-between items-center",
                    h1(:class => "text-2xl font-bold", "Glass.jl Documentation"),
                    a(:href => "/", :class => "btn btn-secondary", "Home")
                )
            ),
            divv(:class => "container mx-auto text-left w-1/2",
                divv(:class => "mt-10",
                    h1(:class => "text-4xl font-bold text-center", "Overview"),
                    divv(:class => "card bordered bg-neutral-content",
                        divv(:class => "card-body",
                            h2(:class => "card-title", "You will learn"),
                            ul(:class => "list-disc list-inside",
                                li("How to create and nest components"),
                                li("How to add markup and styles"),
                                li("How to display data"),
                                li("How to render conditions and lists"),
                                li("How to respond to events and update the screen"),
                                li("How to share data between components")
                            )
                        )
                    ),
                ),
                divv(:class => "mt-10",
                    h1(:class => "text-4xl font-bold text-center", "Creating and Nesting Components"),
                    p("Glass apps are made out of components. A component is a piece of the UI (user interface) that has its own logic and appearance. A component can be as small as a button, or as large as an entire page.", br()),
                    p("Glass components are Julia functions that return htmx:"),
                    divv(
                        :class => "mockup-code",
                        pre(
                            code("""
                            function Mybutton()
                                return button(:class => "btn btn-primary", "I'm a button")
                              end
                            """)
                        )
                    ),
                    p("Now that you’ve declared", span(:class => "font-bold", " Mybutton "), "you can nest it into another component."),
                    divv(
                        :class => "mockup-code",
                        pre(
                            code("""
                            function Myapp()
                                return divv(
                                            h1("Welcome to my app),
                                            Mybutton()
                                        )
                                end

                              export Myapp
                            """)
                        )
                    ),
                    p("Notice that Mybutton() starts with a capital letter. That’s how you know it’s a Glass component. Glass component names must always start with a capital letter, while HTML tags must be lowercase.", br(), "Have a look at the result:"),
                    divv(
                        :class => "mockup-code",
                        pre(
                            code("""
                            function Mybutton()
                                return button(:class => "btn btn-primary", "I'm a button")
                              end
                              
                              function Myapp()
                                return divv(
                                            h1("Welcome to my app),
                                            Mybutton()
                                        )
                              end

                              export Myapp
                            """)
                        )
                    ),
                    divv(:class => "card bordered bg-neutral-content",
                        divv(:class => "card-body",
                            Myapp()
                        )
                    ),
                )
            ),
        )
    )
end

export Quickstart
