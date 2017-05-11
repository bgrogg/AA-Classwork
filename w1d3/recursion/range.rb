def range(min, max)
  return [] if max <= min

  range(min, max - 1) << max - 1
end
