generation_in <- function(day_count = 7, prod_count = 1, product = "������", path_in){

  delivery1 <- sample(27, prod_count)#��������� ������
  delivery2 <- sample(27, prod_count)
  delivery3 <- sample(27, prod_count)
  delivery4 <- sample(27, prod_count)
  delivery5 <- sample(27, prod_count)
  delivery6 <- sample(27, prod_count)
  delivery7 <- sample(27, prod_count)

  res.tab <- switch(day_count,   #���������� ������� � ����������� �� ���-�� ��������� ����  
        data.frame(������ = product, ����������� = delivery1),
        data.frame(������ = product, ����������� = delivery1, ������� = delivery2),
        data.frame(������ = product, ����������� = delivery1, ������� = delivery2, ����� = delivery3),
        data.frame(������ = product, ����������� = delivery1, ������� = delivery2, ����� = delivery3, ������� = delivery4),
        data.frame(������ = product, ����������� = delivery1, ������� = delivery2, ����� = delivery3, ������� = delivery4, ������� = delivery5),
        data.frame(������ = product, ����������� = delivery1, ������� = delivery2, ����� = delivery3, ������� = delivery4, ������� = delivery5, ������� = delivery6),
        data.frame(������ = product, ����������� = delivery1, ������� = delivery2, ����� = delivery3, ������� = delivery4, ������� = delivery5, ������� = delivery6, ����������� = delivery7)
  )
  print(res.tab)
  write.table(res.tab, file = path_in, sep = "  ", dec = ",")
}


product <- c("�", "N") #������

generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in1.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in2.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in3.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in4.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in5.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in6.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in7.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in8.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in9.txt")
generation_in(day_count = 7, prod_count =  2, product =  product, path_in = "in10.txt")

