module EndGame

  def victory?(current_feedback, winning_feedback)
    return true if current_feedback == winning_feedback
    false
  end

end
