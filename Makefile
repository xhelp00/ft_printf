# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phelebra <xhelp00@gmail.com>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/06 18:10:21 by phelebra          #+#    #+#              #
#    Updated: 2023/02/10 12:01:57 by phelebra         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = ft_printf.c ft_putchar.c ft_putstr.c ft_putnbr.c ft_putptr.c 

INC = ft_printf.h
OBJ = $(SRC:.c=.o)
NAME = libftprintf.a
RM = rm -f
CFLAGS = -Wall -Wextra -Werror
LIBC = ar rc
LIBFT = ./libft/libft.a

.c.o:
	cc ${CFLAGS} -c $< -o ${<:.c=.o} -I ${INC}

${NAME}: ${OBJ}
	make -C ./libft
	cp ./libft/libft.a ${NAME}
	${LIBC} ${NAME} ${OBJ}

all: ${NAME}

clean:
	${MAKE} clean -C ./libft
	${RM} ${OBJ}
	${RM} ${BONUS_O}

fclean:	clean
	${MAKE} fclean -C ./libft
	${RM} ${NAME}

re: fclean all
