defmodule PledgeServerTest do
  use ExUnit.Case

  alias Servy.PledgeServer

  test "caches the 3 most recent pledges and totals their amounts" do
    PledgeServer.start()

    PledgeServer.create_pledge("larry", 10)
    PledgeServer.create_pledge("moe", 20)
    PledgeServer.create_pledge("grace", 30)
    PledgeServer.create_pledge("curly", 40)

    most_recent_pledges = [{"curly", 40}, {"grace", 30}, {"moe", 20}]

    assert PledgeServer.recent_pledges() == most_recent_pledges

    assert PledgeServer.total_pledged() == 90
  end
end
