-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 03 2024 г., 11:47
-- Версия сервера: 5.7.39
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sybery`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `count`, `product_id`, `user_id`) VALUES
(4, 4, 10, 3),
(5, 1, 9, 3),
(6, 1, 8, 3),
(7, 4, 7, 3),
(8, 1, 6, 3),
(9, 3, 5, 3),
(10, 3, 3, 3),
(11, 1, 10, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rejection_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Причина отказа',
  `user_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `date`, `rejection_reason`, `user_id`, `order_status_id`) VALUES
(14, '2024-03-06 20:05:26', NULL, 4, 1),
(15, '2024-03-06 20:11:16', NULL, 3, 1),
(16, '2024-04-15 12:43:16', NULL, 4, 1),
(17, '2024-04-15 14:01:41', NULL, 4, 1),
(18, '2024-04-15 14:32:32', NULL, 4, 1),
(19, '2024-04-15 14:38:05', NULL, 4, 1),
(20, '2024-04-15 14:42:16', NULL, 4, 1),
(21, '2024-04-26 12:25:23', NULL, 3, 1),
(22, '2024-04-28 13:47:23', NULL, 4, 1),
(23, '2024-04-28 13:48:41', NULL, 4, 1),
(24, '2024-04-29 13:12:18', NULL, 4, 1),
(25, '2024-04-30 11:16:14', NULL, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order_list`
--

CREATE TABLE `order_list` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id`, `code`, `name`) VALUES
(1, 'new', 'Новый'),
(2, 'confirm', 'Подтверждённый'),
(3, 'reject', 'Отклонённый');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `count` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `count`, `photo`, `country`, `year`, `type_id`) VALUES
(2, 'Реженка', '550.00', 100, 'Реженка.jpg', 'Россия', 2024, 3),
(3, 'Да будет Светлый', '890.00', 96, 'Светлый.jpg', 'Россия', 2024, 3),
(4, 'Рецепт счастья', '499.00', 100, 'Рецепт счастья.jpg', 'Россия', 2024, 3),
(5, 'Секрет Долголетия', '550.00', 97, 'Секрет долголетия.jpg', 'Россия', 2024, 3),
(6, 'Семейные ценности ', '890.00', 99, 'Семейные ценности.jpg', 'Россия', 2024, 3),
(7, 'Служу России', '3999.00', 96, 'служу россии.jpg', 'Россия', 2024, 3),
(8, 'Суть Жизни', '1999.00', 99, 'Суть жизни.jpg', 'Россия', 2024, 3),
(9, 'Я Помню...', '890.00', 98, 'Я помню.jpg', 'Россия', 2024, 3),
(10, 'СемьЯ', '499.00', 87, 'СемьЯ.jpg', 'Россия', 2024, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Обложки фильмов'),
(2, 'Новые постеры'),
(3, 'Постер к фильму');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `surname`, `name`, `patronymic`, `login`, `password`, `email`, `user_role_id`) VALUES
(1, 'Калёнов', 'Матвей', 'Александрович', 'admin', 'admin', 'matvey20333@mail.ru', 2),
(3, 'Смирнов', 'Александр ', 'Иванович ', 'sul', 'sul', 'sul@mail.ru', 1),
(4, 'Попов', 'Дмитрий ', 'Алексеевич ', 'sulik', 'sulik', 'sulik@mail.ru', 1),
(5, 'Козлова ', 'Екатерина ', 'Петровна ', 'Bez', 'Bez', 'Bez@mail.ru', 1),
(6, 'Васильева', 'Наталья ', 'Сергеевна ', 'nat', 'nat', 'nat@mail.ru', 1),
(7, 'Михайлов', 'Иван ', 'Фёдорович ', 'ivan', 'ivan', 'ivan@mail.ru', 1),
(8, 'Николаева', 'Ольга ', 'Андреевна ', 'Oliga', 'Oliga', 'Oliga@mail.ru', 1),
(9, 'Кузнецов', 'Сергей ', 'Владимирович ', 'serg', 'serg', 'serg@mail.ru', 1),
(10, 'Соколова', 'Анна ', 'Васильевна ', 'Anna', 'Anna', 'Anna@mail.ru', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_role`
--

INSERT INTO `user_role` (`id`, `code`, `name`) VALUES
(1, 'user', 'Пользователь'),
(2, 'admin', 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz`
--

CREATE TABLE `zakaz` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Идентификатор заказа',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Имя и фамилия покупателя',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT 'Почта покупателя',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT 'Телефон покупателя',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT 'Адрес доставки',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Комментарий к заказу'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `zakaz`
--

INSERT INTO `zakaz` (`id`, `name`, `email`, `phone`, `address`, `comment`) VALUES
(1, 'Попов', 'matvey20333@mail.ru', '+7 (495) 123-45-67', 'Город Томск, дом 9, кв 92', 'СемьЯ'),
(2, 'Смирнов', 'matvey20333@mail.ru', '+7 (495) 123-45-67', 'Посёлок Светлый, дом 99, кв 99', 'СемьЯ'),
(3, 'Попов', 'matvey20333@mail.ru', '+7 (495) 123-45-67', 'Посёлок Светлый, дом 99, кв 99', 'Служу России');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status_id` (`order_status_id`);

--
-- Индексы таблицы `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id_2` (`order_id`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login_2` (`login`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Индексы таблицы `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `zakaz`
--
ALTER TABLE `zakaz`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор заказа', AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
