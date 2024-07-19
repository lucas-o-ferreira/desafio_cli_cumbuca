defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  test "single name" do
    input = ["Marika"]
    expected = ["Marika I"]

    assert DesafioCli.enumerated_names(input) == expected
  end

  test "empty list" do
    assert DesafioCli.enumerated_names([]) == []
  end

  test "names with special characters" do
    input = ["Ranni@", "Godrick$", "Ranni@", "Godrick$"]
    expected = ["Ranni@ I", "Godrick$ I", "Ranni@ II", "Godrick$ II"]

    assert DesafioCli.enumerated_names(input) == expected
  end

  test "mixed names" do
    input = ["Radagon", "Ranni", "Radagon", "Maliketh", "Ranni", "Radagon"]
    expected = ["Radagon I", "Ranni I", "Radagon II", "Maliketh I", "Ranni II", "Radagon III"]

    assert DesafioCli.enumerated_names(input) == expected
  end

  test "all uniq names" do
    input = ["Miquella", "Malenia", "Marika"]
    expected = ["Miquella I", "Malenia I", "Marika I"]

    assert DesafioCli.enumerated_names(input) == expected
  end

  test "large input of uniq names" do
    input = Enum.map(1..5000, fn i -> "Tarnished #{i}" end)
    expected = Enum.map(1..5000, fn i -> "Tarnished #{i} I" end)

    assert DesafioCli.enumerated_names(input) == expected
  end

  test "large input of identical names" do
    input = List.duplicate("Tarnished", 5000)
    expected = Enum.map(1..5000, fn i -> "Tarnished #{EnumerateNames.to_roman_numeral(i)}" end)

    assert DesafioCli.enumerated_names(input) == expected
  end

  test "too many identical names" do
    input = List.duplicate("Tarnished", 10000)
    expected = Enum.map(1..10000, fn i -> "Tarnished #{EnumerateNames.to_roman_numeral(i)}" end)

    assert DesafioCli.enumerated_names(input) == expected
  end

end
