class Luhn
  def initialize
    cc_num = ARGV[0]
    
    if cc_num.is_a? String
      pre_luhn cc_num
    else
      puts "Please provide String only"
    end 
  end
  
  def pre_luhn cc_num
    cc_num = cc_num.gsub("-","") if cc_num.include? "-"

    @temp_s = cc_num.split ""

    unless @temp_s.size == 16
      puts "Please provide 16 digits number"
    else
      execute_check_luhn cc_num
    end
  end
  
  def execute_check_luhn cc_num
    unless @temp_s.include? "?"
      validate_luhn cc_num
    else
      i = 0
      until i > 9  do
        temp = cc_num.gsub "?", i.to_s
        validate_luhn temp
        i +=1
      end
    end
  end
  
  def validate_luhn(cardNumber)
    nums = cardNumber.to_s.split("")
    checkdigit = nums[nums.length - 1]
    nums[nums.length - 1] = 0
    nums.reverse!
    sum=0
    for i in 1..nums.length
      if i%2==0 
        sum = sum + nums[i].to_i  
        next
      end
      nums[i] = (nums[i].to_i*2 < 10 ) ? (nums[i].to_i*2) : (nums[i].to_i*2 - 9)
      sum = sum + nums[i].to_i
    end
    puts (10 - sum%10).to_i == checkdigit.to_i ? "#{cardNumber} (valid luhn)" : "#{cardNumber} (invalid luhn)"
  end
end

Luhn.new
  







