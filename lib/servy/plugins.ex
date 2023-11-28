defmodule Servy.Plugins do
  alias Servy.Conv
  def emojify(%Conv{status: 200 } = conv) do
    %{ conv | resp_body: "🎉 " <> conv.resp_body <> " 🎉"}
  end

  def emojify(%Conv{} = conv), do: conv

  def track(%Conv{status: 404 , path: path} = conv) do
    IO.puts "#{path} is loose!"
    conv
  end

  def track(%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{ conv | path: "/wildthings"}
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(%Conv{} = conv), do: IO.inspect conv
end
