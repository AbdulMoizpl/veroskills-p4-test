-module (demos_api).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).

main() -> #template { file="./templates/demos46.html" }.

title() -> "Javascript API".

headline() -> "Javascript API".

left() ->
    [
        "
        <p>
        The <code>#api{}</code> element allows you to create a
        Javascript API function on your page that will fire requests
        back to Nitrogen. API postbacks are handled by api_event(Name,
        Tag, Arguments).
        <p>
        The <code>name</code> property specifies the name under which the
        function will be exposed.
        <p>
        The <code>tag</code> property allows you to include an opaque
        value that is passed into the event. It is not exposed to the
        client.
        <p>
        The arguments are an Erlang term that maps to the arguments
        you specified in Javascript. These are true Erlang arguments,
        and can be used for pattern matching. Nitrogen uses <a
        href='http://github.com/rklophaus/BERT-JS'>BERT-JS</a> to
        encode Javascript terms into an Erlang binary.
        <p>
        This demo sets up three Javascript APIs on the page, called
        via the links on the right.
        ",
        linecount:render()
    ].