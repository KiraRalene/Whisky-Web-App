class Search < ApplicationRecord

  def search_whiskies
    whiskies = Whisky.all

    whiskies = whiskies.where(["whiskies.name ILIKE ?", "%#{keywords}%"]) if keywords.present?
    whiskies = whiskies.where(["kind ILIKE ?", "%#{kind}%"]) if kind.present?
    whiskies = whiskies.where(["age = ?", age]) if age.present?
    whiskies = whiskies.where(["distillery ILIKE ?", "%#{distillery}%"]) if distillery.present?
    whiskies = whiskies.where(["price >= ?", min_price]) if min_price.present?
    whiskies = whiskies.where(["price <= ?", max_price]) if max_price.present?

    return whiskies
  end

end
