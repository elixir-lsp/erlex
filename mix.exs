defmodule ErlexVendored.MixProject do
  use Mix.Project

  @version "0.2.6"
  @repo_url "https://github.com/asummers/erlex"

  def project do
    [
      app: :erlex_vendored,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs(),
      dialyzer: dialyzer()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:mix, :erts, :kernel, :stdlib],
      flags: ["-Wunmatched_returns", "-Werror_handling", "-Wrace_conditions", "-Wno_opaque"],
      ignore_warnings: "dialyzer.ignore_warnings.exs",
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0", only: :dev, runtime: false},
      {:dialyxir, "1.0.0-rc.3", only: :dev, runtime: false, override: true},
      {:ex_check, "~> 0.12.0", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Convert Erlang style structs and error messages to equivalent Elixir.
    """
  end

  defp docs() do
    [
      main: "readme",
      source_url: @repo_url,
      source_ref: @version,
      homepage_url: @repo_url,
      extras: ["CHANGELOG.md", "README.md"]
    ]
  end

  defp package do
    [
      files: [
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE.md",
        "src/lexer.xrl",
        "src/parser.yrl"
      ],
      maintainers: ["Andrew Summers"],
      licenses: ["Apache-2.0"],
      links: %{
        "Changelog" => "https://hexdocs.pm/erlex/changelog.html",
        "GitHub" => @repo_url
      }
    ]
  end
end
