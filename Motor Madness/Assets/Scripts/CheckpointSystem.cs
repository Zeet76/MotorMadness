using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using TMPro;
using static CheckpointSystem.CarDataComparer;
using System.Runtime.ConstrainedExecution;
using UnityEngine.InputSystem.XR;

public class CheckpointSystem : MonoBehaviour
{

    public List<CarData> cars;

    public List<CarData> distanceArray = new List<CarData>();

    public TextMeshProUGUI carText;

    public GameObject nextCheckPoint;
    private GameObject GameLogic;
    private LevelManager levelManager;

    public bool isFinishLine = false;
    private float timeSinceLastExecution = 0f;
    private float executionInterval = 0.5f; // 0.2 seconds interval

    private void Awake()
    {
        GameLogic = GameObject.Find("GameLogic");
        levelManager = GameLogic.GetComponent<LevelManager>();
        cars = levelManager.cars;
        
    }

    private void Update()
    {
        timeSinceLastExecution += Time.deltaTime;

        // Check if the desired time interval has passed
        if (timeSinceLastExecution >= executionInterval)
        {
            // Calculate distances for all cars
            distanceArray.Clear();

            for (int i = 0; i < cars.Count; i++)
            {
                float distance = Vector3.Distance(transform.position, GameObject.Find("Car"+i).GetComponent<CarController2>().playerRB.position);
                if (distance < 25f)
                {
                    nextCheckPoint.SetActive(true);
                    gameObject.SetActive(false);
                }

                cars[i].distance = distance;
                cars[i].lap = cars[i].CarPrefab.GetComponent<CarController2>().laps;
                distanceArray.Add(cars[i]);
                levelManager.distanceArray = distanceArray;

            }

            // Sort distances
            distanceArray.Sort(new CarDataComparer());

            // Update car text based on distance
            for (int i = 0; i < cars.Count; i++)
            {
                if (Vector3.Distance(transform.position, GameObject.Find("Car0").GetComponent<CarController2>().playerRB.position) == distanceArray[i].distance)
                {
                    carText.text = $"{i + 1}/{cars.Count}";
                    
                }
            }

            // Reset the timer
            timeSinceLastExecution = 0f;
        }
    }

    private void FixedUpdate()
    {

    }

    public class CarDataComparer : IComparer<CarData>
    {
        public int Compare(CarData x, CarData y)
        {
            if (x.lap != y.lap)
            {
                // If lap is different, compare by lap in descending order.
                return y.lap.CompareTo(x.lap);
            }

            // If lap is the same, compare by distance in ascending order
            return x.distance.CompareTo(y.distance);

        }

    }

    public void SetupNextCheckpoint(CheckpointSystem nextCheckpointSystem)
    {
        nextCheckPoint = nextCheckpointSystem.gameObject;
    }

   

    
}