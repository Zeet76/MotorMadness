using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[System.Serializable]
public class CharacterData
{
    public string characterName;
    public int currentLevel;
    public int money;
    public List<CarData> OwnedCars;
    public CarData SelectedCar;


    public CharacterData(string name)
    {
        characterName = name;
        currentLevel = 1;
        money = 0;
        OwnedCars = new List<CarData>();
        SelectedCar = new CarData();    
        
    }

    public void SetRacerNameForOwnedCars()
    {
        foreach (var ownedCar in OwnedCars)
        {
            ownedCar.RacerName = characterName;
        }
    }

}


[System.Serializable]
public class CarData
{
    public int CarID;
    public string CarName;
    public string RacerName;
    public GameObject CarPrefab;
    public float distance;
    public float lap;
    public int points;
    public int price;
    public CarUpgrade upgradelvls;

    public CarData()
    {
        upgradelvls = new CarUpgrade();
    }
    public object Clone()
    {
        return new CarData
        {
            CarID = CarID,
            CarName = CarName,
            RacerName = RacerName,
            CarPrefab = CarPrefab,
            distance = distance,
            lap = lap,
            points = points,
            price = price
        };
    }
}



[System.Serializable]
public class CarUpgrade
{
    public int TorqueUpgrade;
    public int GearUpgrade;
    public int BreakUpgrade;
    public int TireUpdrage;

    public CarUpgrade()
    {
        TorqueUpgrade = 0;
        GearUpgrade = 0;
        BreakUpgrade = 0;
        TireUpdrage = 0;

    }
}


[System.Serializable]
public class GameData{
    public List<CharacterData> characters;
    public List<CarData> GameCars;


    public GameData()
    {
        characters = new List<CharacterData>();
        GameCars = new List<CarData>();
    }
}

