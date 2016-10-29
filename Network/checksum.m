 function [summation] = checksum(array)
% Function that calculates the checksum given the package to send 
    part1=bitconcat(fi(array(4:6)));
    part2=bitconcat(fi(array(7:9)));
    part3=bitconcat(fi(array(10:12)));
    part4=bitconcat(fi(array(13:15)));
    part5=bitconcat(fi(array(16:18)));
  
    summation=part1+part2+part3+part4+part5;
    
    carry=bitand(fi(uint32(abs(summation))),uint32(117440512));
    carry=bitshift(carry,-24);
    
    summation=uint32(summation+carry);
    
    summation=bitcmp(summation);
end
