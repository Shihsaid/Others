#�������� �������� �������� �������
tab_out <- function(count, path_in1, path_in2){
  in1 <- read.table(file = path_in1, head = T)
  in2 <- read.table(file = path_in2, head = T)

  
  value <- sample(100, nrow(in1))  #���� �������
  value_shop <- value - 30 #���� ������� �������
  value_unsale <- 25 #���� ��������
  revenue = c(0, 0, 0, 0, 0, 0, 0)
  realize = 0
  supply = 0
  equability = c(0, 0, 0, 0, 0, 0, 0)
  
  for (i in 1:ncol(in1)){   #������ �������, ����������, �������� � ����. ������
    for (j in  1:nrow(in1)){
      if (is.integer(in1[j, i]) || is.double(in1[i, j])){
        revenue[i - 1] <- revenue[i - 1] + in2[j, i]*value[j]
        equability[i - 1] <- equability[i - 1] + in2[j, i]
        realize <- realize + in2[j, i]
        supply <- supply + in1[j, i]
      }
    }
  }
  
  
  
  unsale <- supply - realize
  revenue <- sum(revenue)
  profit <- revenue - value_shop * supply - unsale * value_unsale
  equability <- round(sd(equability), 2)
              
  res.tab_week$�������[count] <- revenue
  res.tab_week$����������[count] <- realize
  res.tab_week$��������[count] <- unsale
  res.tab_week$�������[count] <- profit
  res.tab_week$sd[count] <- equability

  return (res.tab_week)
}

table <- rep(0, 12)

res.tab_week = data.frame(������� = table, ������� = table, ���������� = table, 
                                 �������� = table, sd = table)

#������ �������
res.tab_week <- (tab_out(1, path_in1 = "in1.txt", path_in2 = "out1.txt"))
res.tab_week <- (tab_out(2, path_in1 = "in2.txt", path_in2 = "out2.txt"))
res.tab_week <- (tab_out(3, path_in1 = "in3.txt", path_in2 = "out3.txt"))
res.tab_week <- (tab_out(4, path_in1 = "in4.txt", path_in2 = "out4.txt"))
res.tab_week <- (tab_out(5, path_in1 = "in5.txt", path_in2 = "out5.txt"))
res.tab_week <- (tab_out(6, path_in1 = "in6.txt", path_in2 = "out6.txt"))
res.tab_week <- (tab_out(7, path_in1 = "in7.txt", path_in2 = "out7.txt"))
res.tab_week <- (tab_out(8, path_in1 = "in8.txt", path_in2 = "out8.txt"))
res.tab_week <- (tab_out(9, path_in1 = "in9.txt", path_in2 = "out9.txt"))
res.tab_week <- (tab_out(10, path_in1 = "in10.txt", path_in2 = "out10.txt"))

#������� �������� ��������
res.tab_week$�������[11] <- sum(res.tab_week$�������)
res.tab_week$����������[11] <- sum(res.tab_week$����������)
res.tab_week$��������[11] <- sum(res.tab_week$��������)
res.tab_week$�������[11] <- sum(res.tab_week$�������)
res.tab_week$sd[11] <- sum(res.tab_week$sd)

#������� ������� ��������
res.tab_week$�������[12] <- round(mean(res.tab_week$�������[1:10]))
res.tab_week$����������[12] <- round(mean(res.tab_week$����������[1:10]))
res.tab_week$��������[12] <- round(mean(res.tab_week$��������[1:10]))
res.tab_week$�������[12] <- round(mean(res.tab_week$�������[1:10]))
res.tab_week$sd[12] <- round(mean(res.tab_week$sd[1:10]))

print(res.tab_week)

write.table(res.tab_week, file = "C:/Market/out1.csv", sep = ";", dec = ',')


#=========================================================

#�������
#������ ���������� ��� ���������

keys <- function(file1 = "", file2 = "", var = 1, product = 1){
  
  in1 <- read.table(file = file1, head = T)
  in2 <- read.table(file = file2, head = T)
  sale <- rep(0, ncol(in1) - 1)
  supply <- rep(0, ncol(in1) - 1)
  
  for (i in 1:ncol(in2) - 1){
    sale[i] <- in2[product, i + 1]
    supply[i] <- in1[product, i + 1]
  }
  supply <- as.integer(supply)
  sale <- as.integer(sale)
  unsale <- supply - sale
  
  len_x = seq(1:(ncol(in2) - 1))
  
  revenue <- value[1] * sale
  
  profit <- revenue - value_shop * supply - unsale * value_unsale
  rentab <- profit / revenue
  
  if (var == 1)
    return(sale)
  if (var == 2)
    return(revenue)
  if (var == 3)
    return(profit)
  if (var == 4)
    return(unsale)
  if (var == 5)
    return(rentab)
}


#������ ���������� ��� 1 ��������
sale <- keys(file1 = "in1.txt", file2 = "out1.txt", var = 1)
revenue <- keys(file1 = "in1.txt", file2 = "out1.txt", var = 2)
profit <- keys(file1 = "in1.txt", file2 = "out1.txt", var = 3)
unsale <- keys(file1 = "in1.txt", file2 = "out1.txt", var = 4)
rentab <- keys(file1 = "in1.txt", file2 = "out1.txt", var = 5)  

graphs <- function(y, fg, main, ylab, sub = ""){ #������� ��� ������ �������
  plot(x = len_x, 
       y = y, 
       type = "l", 
       fg = fg,
       main = main,
       sub = sub,
       xlab = "��� ������", 
       ylab = ylab,
       col = "black")
}

lin_gr <- function(y, fg, main, ylab){ #������� ��� ������ ���.�������
  lines(x = len_x, 
      y = y, 
      type = "l", 
      fg = fg,
      main = main,
      xlab = "��� ������", 
      ylab = ylab,
      col = "green")
}

#����� ������� ��� 1 ��������

graphs(y = sale, fg = "black", main = "������ ������������� ������ 1 ��������", ylab =  "����� ������" )
graphs(y = revenue, fg = "red", main = "������ ������������� ������ 1 ��������", ylab =  "�������" )
graphs(y = profit, fg = "yellow", main = "������ ������������� ������ 1 ��������", ylab =  "�������" )
graphs(y = unsale, fg = "green", main = "������ ������������� ������ 1 ��������", ylab =  "��������" )
graphs(y = rentab, fg = "orange", main = "������ ������������� ������ 1 ��������", ylab =  "��������������" )


#������ ���������� ��� 2 ��������
sale <- keys(file1 = "in2.txt", file2 = "out2.txt", var = 1)
revenue <- keys(file1 = "in2.txt", file2 = "out2.txt", var = 2)
profit <- keys(file1 = "in2.txt", file2 = "out2.txt", var = 3)
unsale <- keys(file1 = "in2.txt", file2 = "out2.txt", var = 4)
rentab <- keys(file1 = "in2.txt", file2 = "out2.txt", var = 5) 

#����� ������� ��� 2 ��������
graphs(y = sale, fg = "black", main = "������ ������������� ������ 2 ��������", ylab =  "����� ������" )
graphs(y = revenue, fg = "red", main = "������ ������������� ������ 2 ��������", ylab =  "�������" )
graphs(y = profit, fg = "yellow", main = "������ ������������� ������ 2 ��������", ylab =  "�������" )
graphs(y = unsale, fg = "green", main = "������ ������������� ������ 2 ��������", ylab =  "��������" )
graphs(y = rentab, fg = "orange", main = "������ ������������� ������ 2 ��������", ylab =  "��������������" )


#=========================================================

sum_product <- rep(0, 10)#����� ������ ������� �������� ������ ��������

#������ ������ ������ ���� ������� ��� 1 ��������
sale1 <- keys(file1 = "in1.txt", file2 = "out1.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in1.txt", file2 = "out1.txt", var = 1, product = 2)
sum_product[1] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 1 ��������", ylab =  "����� ������(��)", sub = "������ ����� - 1 �����, ������� ����� - 2 ����� " )
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 1 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 2 ��������
sale1 <- keys(file1 = "in2.txt", file2 = "out2.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in2.txt", file2 = "out2.txt", var = 1, product = 2)
sum_product[2] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 2 ��������", ylab =  "����� ������(��)", sub = "������ ����� - 1 �����, ������� ����� - 2 ����� ")
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 2 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 3 ��������
sale1 <- keys(file1 = "in3.txt", file2 = "out3.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in3.txt", file2 = "out3.txt", var = 1, product = 2)
sum_product[3] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 3 ��������", ylab =  "����� ������(��)", sub = "������ ����� - 1 �����, ������� ����� - 2 ����� " )
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 3 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 4 ��������
sale1 <- keys(file1 = "in4.txt", file2 = "out4.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in4.txt", file2 = "out4.txt", var = 1, product = 2)
sum_product[4] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 4 ��������", ylab =  "����� ������(��)", sub = "������ ����� - 1 �����, ������� ����� - 2 ����� " )
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 4 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 5 ��������
sale1 <- keys(file1 = "in5.txt", file2 = "out5.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in5.txt", file2 = "out5.txt", var = 1, product = 2)
sum_product[5] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 5 ��������", ylab =  "����� ������(��)" , sub = "������ ����� - 1 �����, ������� ����� - 2 ����� ")
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 5 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 6 ��������
sale1 <- keys(file1 = "in6.txt", file2 = "out6.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in6.txt", file2 = "out6.txt", var = 1, product = 2)
sum_product[6] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 6 ��������", ylab =  "����� ������(��)", sub = "������ ����� - 1 �����, ������� ����� - 2 ����� " )
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 6 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 7 ��������
sale1 <- keys(file1 = "in7.txt", file2 = "out7.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in7.txt", file2 = "out7.txt", var = 1, product = 2)
sum_product[7] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 7 ��������", ylab =  "����� ������(��)" , sub = "������ ����� - 1 �����, ������� ����� - 2 ����� ")
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 7 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 8 ��������
sale1 <- keys(file1 = "in8.txt", file2 = "out8.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in8.txt", file2 = "out8.txt", var = 1, product = 2)
sum_product[8] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 8 ��������", ylab =  "����� ������(��)" , sub = "������ ����� - 1 �����, ������� ����� - 2 ����� ")
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 8 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 9 ��������
sale1 <- keys(file1 = "in9.txt", file2 = "out9.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in9.txt", file2 = "out9.txt", var = 1, product = 2)
sum_product[9] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 9 ��������", ylab =  "����� ������(��)" , sub = "������ ����� - 1 �����, ������� ����� - 2 ����� ")
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 9 ��������", ylab =  "����� ������(��)" )

#������ ������ ������ ���� ������� ��� 10 ��������
sale1 <- keys(file1 = "in10.txt", file2 = "out10.txt", var = 1, product = 1)
sale2 <- keys(file1 = "in10.txt", file2 = "out10.txt", var = 1, product = 2)
sum_product[10] <- sum(sale1)

graphs(y = sale1, fg = "black", main = "������ ������ ������ ���� ������� ��� 10 ��������", ylab =  "����� ������(��)", sub = "������ ����� - 1 �����, ������� ����� - 2 ����� " )
lin_gr(y = sale2, fg = "green", main = "������ ������ ������ ���� ������� ��� 10 ��������", ylab =  "����� ������(��)" )


#=========================================================
#������ ������, ������������ � ���������
colour_lst <- c("red", "orange", "yellow", "green", "blue", "purple", "black", "white", "brown", "grey")

#�������� ���������
pie(x = sum_product,
    labels = sum_product,
    main = "��������� ������ 1 ������ ��� 10 ���������",
    sub = "1 - �������, 2 - ���������
          3 - ������, 4 - �������
          5 - �����, 6 - ����������
          7 - ������, 8 - �����
          9 - ����������, 10 - �����",
    col = colour_lst)

