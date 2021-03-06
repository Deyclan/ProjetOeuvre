-- phpMyAdmin SQL Dump
-- version 4.5.1adherentadherent
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- GÃ©nÃ©rÃ© le :  Lun 01 FÃ©vrier 2016 Ã  16:45
-- Version du serveur :  10.1.8-MariaDB
-- Version de PHP :  5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de donnÃ©es :  `baseoeuvre`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE baseoeuvre.`adherent` (
  `id_adherent` int(10) UNSIGNED NOT NULL,
  `nom_adherent` varchar(100) NOT NULL,
  `prenom_adherent` varchar(100) DEFAULT NULL,
  `ville_adherent` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `adherent`
--

INSERT INTO baseoeuvre.`adherent` (`id_adherent`, `nom_adherent`, `prenom_adherent`, `ville_adherent`) VALUES
(1, 'LESSERTISSEUR', 'Christelle', 'Lyon'),
(2, 'MARTIN', 'Laurent', 'Lyon'),
(3, 'DUPONT', 'Didier', 'Lyon'),
(4, 'DURANT', 'Michel', 'Givors'),
(5, 'CHOPIN', 'Daniel', 'Villefranche'),
(6, 'MOZART', 'Albert', 'Craponne'),
(7, 'FRUCCI', 'Fraise', 'Craponne'),
(8, 'BRUN', 'Pierre', 'Lyon'),
(9, 'Blanc', 'Serge', 'Oullins');

-- --------------------------------------------------------

--
-- Structure de la table `oeuvrepret`
--

CREATE TABLE baseoeuvre.`oeuvrepret` (
  `id_oeuvrepret` int(10) UNSIGNED NOT NULL,
  `titre_oeuvrepret` varchar(200) NOT NULL,
  `id_proprietaire` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `oeuvrepret`
--

INSERT INTO baseoeuvre.`oeuvrepret` (`id_oeuvrepret`, `titre_oeuvrepret`, `id_proprietaire`) VALUES
(1, 'Oeuvre en pret 1', 1000),
(2, 'Oeuvre en pret 2', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `oeuvrevente`
--

CREATE TABLE baseoeuvre.`oeuvrevente` (
  `id_oeuvrevente` int(10) UNSIGNED NOT NULL,
  `titre_oeuvrevente` varchar(200) NOT NULL,
  `etat_oeuvrevente` varchar(1) NOT NULL,
  `prix_oeuvrevente` float NOT NULL,
  `id_proprietaire` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `oeuvrevente`
--

INSERT INTO baseoeuvre.`oeuvrevente` (`id_oeuvrevente`, `titre_oeuvrevente`, `etat_oeuvrevente`, `prix_oeuvrevente`, `id_proprietaire`) VALUES
(10000, 'lala', 'L', 12, 1000),
(10001, 'Ete', 'R', 400, 1000),
(10002, 'Automne', 'L', 10, 1000),
(10003, 'Crepuscule', 'R', 111, 1001),
(10004, 'Hiver', 'R', 234, 1000),
(10005, 'Aurore', 'L', 654, 1002),
(10006, 'Nuit de printemps', 'L', 789, 1001),
(10007, 'nouvelle Oeuvre 2', 'L', 12, 1000);

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE baseoeuvre.`proprietaire` (
  `id_proprietaire` int(10) UNSIGNED NOT NULL,
  `nom_proprietaire` varchar(100) CHARACTER SET latin1 NOT NULL,
  `prenom_proprietaire` varchar(100) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `proprietaire`
--

INSERT INTO baseoeuvre.`proprietaire` (`id_proprietaire`, `nom_proprietaire`, `prenom_proprietaire`) VALUES
(1000, 'DUPONT', 'Isabelle'),
(1001, 'DUPUIS', 'Valerie'),
(1002, 'MOZART', 'Albert');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE baseoeuvre.`reservation` (
  `id_oeuvrevente` int(10) UNSIGNED NOT NULL,
  `id_adherent` int(10) UNSIGNED NOT NULL,
  `date_reservation` date NOT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `reservation`
--

INSERT INTO baseoeuvre.`reservation` (`id_oeuvrevente`, `id_adherent`, `date_reservation`, `statut`) VALUES
(10003, 3, '2013-02-22', 'confirmee'),
(10004, 7, '2013-02-22', 'confirmee');

--
-- Index pour les tables exportÃ©es
--

--
-- Index pour la table `adherent`
--
ALTER TABLE baseoeuvre.`adherent`
  ADD PRIMARY KEY (`id_adherent`);

--
-- Index pour la table `oeuvrepret`
--
ALTER TABLE baseoeuvre.`oeuvrepret`
  ADD PRIMARY KEY (`id_oeuvrepret`),
  ADD KEY `id_proprietaire` (`id_proprietaire`);

--
-- Index pour la table `oeuvrevente`
--
ALTER TABLE baseoeuvre.`oeuvrevente`
  ADD PRIMARY KEY (`id_oeuvrevente`),
  ADD KEY `id_proprietaire` (`id_proprietaire`);

--
-- Index pour la table `proprietaire`
--
ALTER TABLE baseoeuvre.`proprietaire`
  ADD PRIMARY KEY (`id_proprietaire`);

--
-- Index pour la table `reservation`
--
ALTER TABLE baseoeuvre.`reservation`
  ADD PRIMARY KEY (`id_oeuvrevente`,`id_adherent`),
  ADD KEY `id_adherent` (`id_adherent`);

--
-- AUTO_INCREMENT pour les tables exportÃ©es
--

--
-- AUTO_INCREMENT pour la table `adherent`
--
ALTER TABLE baseoeuvre.`adherent`
  MODIFY `id_adherent` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `oeuvrepret`
--
ALTER TABLE baseoeuvre.`oeuvrepret`
  MODIFY `id_oeuvrepret` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `oeuvrevente`
--
ALTER TABLE baseoeuvre.`oeuvrevente`
  MODIFY `id_oeuvrevente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10008;
--
-- AUTO_INCREMENT pour la table `proprietaire`
--
ALTER TABLE baseoeuvre.`proprietaire`
  MODIFY `id_proprietaire` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;
--
-- Contraintes pour les tables exportÃ©es
--

--
-- Contraintes pour la table `oeuvrepret`
--
ALTER TABLE baseoeuvre.`oeuvrepret`
  ADD CONSTRAINT `oeuvrepret_ibfk_1` FOREIGN KEY (`id_proprietaire`) REFERENCES `proprietaire` (`id_proprietaire`);

--
-- Contraintes pour la table `oeuvrevente`
--
ALTER TABLE baseoeuvre.`oeuvrevente`
  ADD CONSTRAINT `oeuvrevente_ibfk_1` FOREIGN KEY (`id_proprietaire`) REFERENCES `proprietaire` (`id_proprietaire`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE baseoeuvre.`reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_oeuvrevente`) REFERENCES `oeuvrevente` (`id_oeuvrevente`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id_adherent`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;