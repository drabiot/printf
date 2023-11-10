# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tchartie <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/11 18:05:50 by tchartie          #+#    #+#              #
#    Updated: 2023/11/09 01:17:11 by tchartie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = clang							#Compilation
CFLAGS = -Wall -Wextra -Werror		#Flags for compilation
GFLAGS = $(CFLAGS) -g				#Flag for gdb or valgrind
NAME = libftprintf.a						#Name of lib
SRCS = ft_printf.c \
	ft_putchar.c \
	ft_putnbr.c \
	ft_putnbr_unsigned.c \
	ft_putstr.c \
	ft_conv_hexa.c\
	ft_point_to_hexa.c
OBJS = $(SRCS:.c=.o)				#Change madatory .c to .o

all : $(NAME)

$(NAME) : $(OBJS)
	ar -rcs $(NAME) $(OBJS)

%.o : %.c ft_printf.h
	$(CC) $(CFLAGS) -c $< -o $@

clean :								#Rule clean (Delete all .o)
	rm -rf $(OBJS)

fclean : clean						#Rule fclean (Delete all .o & libft.a)
	rm -rf $(NAME)

re : fclean all						#Rule re (Delete all .o & libft.a, Create all .o and libft.a)

.PHONY : all clean fclean re
