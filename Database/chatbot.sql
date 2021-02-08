-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 08. úno 2021, 14:27
-- Verze serveru: 10.4.17-MariaDB
-- Verze PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `chatbot`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `dotaz`
--

CREATE TABLE `dotaz` (
  `id` int(11) NOT NULL,
  `odpoved_id` int(11) NOT NULL,
  `text` text COLLATE utf8_czech_ci NOT NULL,
  `priorita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `dotaz`
--

INSERT INTO `dotaz` (`id`, `odpoved_id`, `text`, `priorita`) VALUES
(4, 1, 'ahoj', 1),
(5, 1, 'zdar', 1),
(6, 1, 'cau', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `historie`
--

CREATE TABLE `historie` (
  `id` int(11) NOT NULL,
  `message` text COLLATE utf8_czech_ci NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(10) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `historie`
--

INSERT INTO `historie` (`id`, `message`, `date`, `type`) VALUES
(1, 'cau', '2021-01-20 01:41:00', 'user'),
(2, 'Ahoj, jak se máš?', '2021-01-20 01:41:00', 'bot'),
(3, 'čau', '2021-01-20 01:41:03', 'user'),
(4, 'Nevím co říct, zkus se zeptat na něco jiného :/', '2021-01-20 01:41:03', 'bot'),
(5, 'čusík', '2021-01-20 01:41:06', 'user'),
(6, 'Nevím co říct, zkus se zeptat na něco jiného :/', '2021-01-20 01:41:06', 'bot');

-- --------------------------------------------------------

--
-- Struktura tabulky `odpoved`
--

CREATE TABLE `odpoved` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `odpoved`
--

INSERT INTO `odpoved` (`id`, `text`) VALUES
(1, 'Ahoj!||Nazdárek :P||Čusík :)||Ahoj, jak se máš?');

-- --------------------------------------------------------

--
-- Struktura tabulky `slovnik`
--

CREATE TABLE `slovnik` (
  `id` int(11) NOT NULL,
  `vstup` text COLLATE utf8_czech_ci NOT NULL,
  `vystup` text COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `slovnik`
--

INSERT INTO `slovnik` (`id`, `vstup`, `vystup`) VALUES
(1, 'undefined', 'Nevím co říct, zkus se zeptat na něco jiného.'),
(2, 'Jak se máš?||Jak je?', 'Dnes se mám skvěle!'),
(3, 'Jak se jmenuješ?||Jaké máš označení?||Tvé jméno?', 'Jmenuji se Bob.'),
(4, 'Ahoj||Čau||Zdar', 'Nazdárek, jak se dneska máš?'),
(5, 'Odkud pocházíš?||Odkud jsi?||Kde jsi vznikl?', 'Vznikl jsem se v České republice.'),
(6, 'Zatím||Měj se||Sbohem', 'Uvidíme se příště ;)'),
(7, 'Kolik máš let?||Kolik máš?||Jak jsi starý?', 'Jak jsem starý nevím :\\');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `dotaz`
--
ALTER TABLE `dotaz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRes` (`odpoved_id`);

--
-- Klíče pro tabulku `historie`
--
ALTER TABLE `historie`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `odpoved`
--
ALTER TABLE `odpoved`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `slovnik`
--
ALTER TABLE `slovnik`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `dotaz`
--
ALTER TABLE `dotaz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `historie`
--
ALTER TABLE `historie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `odpoved`
--
ALTER TABLE `odpoved`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `slovnik`
--
ALTER TABLE `slovnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `dotaz`
--
ALTER TABLE `dotaz`
  ADD CONSTRAINT `dotaz_ibfk_1` FOREIGN KEY (`odpoved_id`) REFERENCES `odpoved` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
