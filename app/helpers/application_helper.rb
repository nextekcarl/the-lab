module ApplicationHelper

  def random_adjective
    ['Feeble', 'Minor', 'Average', 'Major', 'Cosmic', 'Godlike'].shuffle.first
  end
end
