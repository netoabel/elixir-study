defmodule Tower do
  defstruct location: "", height: 20, planemo: :earth, name: ""
end

defimpl Valid, for: Tower do
  def valid?(%Tower{planemo: planemo, height: height}) do
    height >= 0 and planemo != nil
  end
end