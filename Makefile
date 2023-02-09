# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phelebra <xhelp00@gmail.com>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/06 18:10:21 by phelebra          #+#    #+#              #
#    Updated: 2023/02/09 16:40:47 by phelebra         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = ft_printf.c ft_putchar.c ft_putstr.c ft_putnbr.c \
	libft/ft_putchar_fd.c libft/ft_putstr_fd.c \
	libft/ft_strlen.c libft/ft_itoa.c

OBJ = ${SRC:.c=.o} ${LIBFT_OBJ}

LIBFT_OBJ = ${SRC:.c=.o}

LIBFT_INC = -Ilibft

INC = ft_printf

NAME = libftprintf.a

LIBFT = libft

LIBC = ar rc

LIBR = ranlib

RM = rm -f

CFLAGS = -Wall -Wextra -Werror ${LIBFT_INC}

.c.o: 
	cc ${CFLAGS} -c $< -o ${<:.c=.o} -I ${INC}
${NAME}: ${OBJ}
	${LIBC} ${NAME} ${OBJ}
	${LIBR} ${NAME}
	-l${LIBFT}

all: ${NAME} ${LIBFT}

#${LIBFT}: ${LIBFT_OBJ}
#	ar rc ${LIBFT} ${LIBFT_OBJ}
#	ranlib ${LIBFT}

clean:
	rm -f ${OBJ} ${LIBFT_OBJ}

fclean: clean
		rm -f ${NAME}
re:		fclean all

.PHONY:		all clean fclean re
