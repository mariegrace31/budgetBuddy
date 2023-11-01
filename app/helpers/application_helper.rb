module ApplicationHelper
  def format_large_number(number)
    return number.to_s if number <= 0

    suffixes = {
      0 => '', # No suffix for numbers less than 1,000
      1 => 'K', # 'Thousand' suffix
      2 => 'M', # 'Million' suffix
      3 => 'B' # 'Billion' suffix, and so on...
      # Add more suffixes as needed for larger numbers
    }

    order = (Math.log10(number) / 3).to_i
    suffix = suffixes[order]

    formatted_number = if order.positive?
        # Convert to float and remove trailing ".0"
                         (number / (10**(order * 3).to_f)).round(1).to_s.sub(/\.0$/, '')
                       else
                         number.to_s
                       end

    "#{formatted_number}#{suffix}"
  end
end
