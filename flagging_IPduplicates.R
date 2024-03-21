
#### Finding Duplicate 'IP Addresses" ####
### Code written by Stephen M. Baum ###
### Last updated on 03.21.2024 ###

# Note - this example assumes that you have permission to collect IP data #
# it is easy to swap the IPAddress variable with some other individual identifier #

# assume res_dat = data
# assume IPAddress = column in res_data with IP addresses

# function to see if there are duplicate IP addresses
flag_func = function(res_dat) {
  # flag duplicates
  res_dat$dup_ip = ifelse(duplicated(res_dat$IPAddress) | duplicated(res_dat$IPAddress, fromLast = TRUE), 1, 0)
  
  # count duplicates
  dup_counts = table(res_dat$dup_ip)
  
  # return data w/ count of duplicates
  return(list(res_dat = res_dat, counts = dup_counts))
}

# apply flag_func
result = flag_func(res_dat)
print(result$counts) # how many duplicates?