module PostHelper
  private
  def create_date
    self.updated_at = self.published_at = DateTime.current
  end
  def update_date
    self.updated_at = DateTime.current
  end
end