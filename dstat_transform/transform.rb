# When it starts
test_start_hour = 20
# When it will stop (The last hour)
test_end_hour = 23
 
puts 'time,cpu_idl,cpu_usr,load1min,memused,memfree,netrcvd,netsend,swapused,swapfree'
File.open("dstat.20110627.log").each do |r|
  if not r =~ /system/ and not r =~ /time/ then
    record = r.split("|")
    dstat_datetime = record[0].split
    dstat_time = dstat_datetime[1]
    dstat_cpu = record[1].split
    dstat_load = record[2].split
    dstat_mem = record[3].split
    dstat_net = record[4].split
    dstat_swap = record[6].split
    
    dstat_time_hour = dstat_time.split(':')[0].to_i
    if dstat_time_hour >= test_start_hour and dstat_time_hour <= test_end_hour then
      idl_cpu = dstat_cpu[2]
      usr_cpu = dstat_cpu[0]
      if dstat_mem[0] =~ /M/ then
        real_mem_used = dstat_mem[0].gsub('M', '').to_i * 1024 * 1024
      end
      if dstat_mem[3] =~ /M/ then
        real_mem_free = dstat_mem[3].gsub('M', '').to_i * 1024 * 1024
      end
      if dstat_net[0] =~ /k/ then
        dstat_net_rcvd = dstat_net[0].gsub('k', '').to_i * 1024
      end
      if dstat_net[1] =~ /k/ then
        dstat_net_send = dstat_net[1].gsub('k', '').to_i * 1024
      end
      if dstat_swap[0] =~ /M/ then
        dstat_swap_used = dstat_swap[0].gsub('M', '').to_i * 1024 * 1024
      end
      if dstat_swap[1] =~ /M/ then
        dstat_swap_free = dstat_swap[1].gsub('M', '').to_i * 1024 * 1024
      end
 
      line = "#{dstat_time},#{idl_cpu},#{usr_cpu},#{dstat_load[0]},#{real_mem_used},#{real_mem_free},#{dstat_net_rcvd},#{dstat_net_send},#{dstat_swap_used},#{dstat_swap_free}"
      puts line
    end
  end
end