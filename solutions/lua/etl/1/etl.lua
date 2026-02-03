return {
  transform = function(dataset)
    local letter_map = {}
    for points, groups in pairs(dataset) do
      for _, group in ipairs(groups) do
        letter_map[group:lower()] = points
      end
    end
    return letter_map
  end
}
