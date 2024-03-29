using Oxygen, HTTP, Glass

function Todo()
    tasks = Vector{String}()

    function render_tasks(tasks)
        html_elements = ""
        for (index, task) in enumerate(tasks)
            html_elements *= divv(:class => "flex justify-between items-center pl-2",
                divv(:class => "task-text", task),
                button(:hx_post => "/todo/todos/$(index)/delete", :hx_target => "#task-list", :class => "btn btn-error w-1/4", "Remove")
            )
        end
        return html_elements
    end

    @get "/todo/todos" function ()
        return render_tasks(tasks)
    end

    @post "/todo/todos" function(req::HTTP.Request)
        task_dict = HTTP.URIs.queryparams(String(req.body))
        task = get(task_dict, "task", "")
        task = HTTP.URIs.unescapeuri(task) # Decode URL-encoded characters
        push!(tasks, task)
        return render_tasks(tasks) # Render the updated task list
    end

    @post "/todo/todos/{id}/delete" function (req::HTTP.Request, id::String)
        index = parse(Int, id)
        deleteat!(tasks, index)
        return render_tasks(tasks)
    end
    
    return html(
        head(
            meta(:charset => "UTF-8"),
            meta(:name => "viewport", :content => "width=device-width, initial-scale=1.0"),
            title("To-Do App"),
            link(:href => "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css", :rel => "stylesheet"),
            link(:href => "https://cdn.jsdelivr.net/npm/daisyui/dist/full.css", :rel => "stylesheet"),
            script(:src => "https://unpkg.com/htmx.org@1.9.4", :integrity => "sha384-zUfuhFKKZCbHTY6aRR46gxiqszMk5tcHjsVFxnUo8VMus4kHGVdIYVbOYYNlKmHV", :crossorigin => "anonymous")
        ),
        body(:class => "bg-neutral-100",
            nav(:class => "bg-primary py-4",
                divv(:class => "container mx-auto text-white flex justify-between items-center",
                    h1(:class => "text-2xl font-bold", "To-Do App"),
                    a(:href => "/", :class => "btn btn-secondary", "Home")
                )
            ),
            divv(:class => "container mx-auto text-center py-10 w-1/2",
                h1(:class => "text-4xl font-bold mb-4", "To-Do App"),
                form(:hx_post => "/todo/todos", :hx_target => "#task-list", :class => "mb-4 flex justify-center",
                    input(:type => "text", :name => "task", :id => "task-input", :placeholder => "Enter a task", :class => "border p-2 rounded flex-grow"),
                    button(:type => "submit", :class => "btn btn-primary w-1/4 ml-2", "Add Task")
                ),
                divv(:id => "task-list", :class => "space-y-2 card min-h-screen")
            )
        )
    )
end

export Todo