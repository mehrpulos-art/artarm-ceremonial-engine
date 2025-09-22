// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CeremonyRegistry {
    struct Ceremony {
        string name;
        string description;
        string date;
        address author;
    }

    Ceremony[] public ceremonies;

    event CeremonyCreated(string name, string date, address author);

    function registerCeremony(string memory _name, string memory _description, string memory _date) public {
        ceremonies.push(Ceremony(_name, _description, _date, msg.sender));
        emit CeremonyCreated(_name, _date, msg.sender);
    }

    function getCeremony(uint index) public view returns (
        string memory name,
        string memory description,
        string memory date,
        address author
    ) {
        Ceremony memory c = ceremonies[index];
        return (c.name, c.description, c.date, c.author);
    }

    function getCeremonyCount() public view returns (uint) {
        return ceremonies.length;
    }
}