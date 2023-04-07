
macro button(text)
    return @htl """
    	<button>$(eval(text))</button>
    """
end

macro div(macros...)
    return @htl """
    	<div>$(eval.(macros))</div>
    """
end;

macro h1(text)
    return @htl """
    	<h1>$(eval(text))</h1>
    """
end

macro p(text)
    return @htl """
    	<p>$(text)</p> 
    """
end

export @button, @div, @h1, @p