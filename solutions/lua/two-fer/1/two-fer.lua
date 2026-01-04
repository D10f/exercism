local TwoFer = {}

function TwoFer.two_fer(name)
  if name then
    return 'One for ' .. name .. ', one for me.'
  else
    return 'One for you, one for me.'
  end
end

return TwoFer
