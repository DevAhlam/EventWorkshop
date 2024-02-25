
# APP STATEMENT
An API system for event provider who need to mange their events and workshops, so the participant can register in this events.




## FEATURE LIST
1-Event provider to create new events, workshops.

2-Event provider can retrieve information about events, workshops.

3- Event provider to modify details of existing events, workshops.

4-Event provider to remove events, workshops.

5- Participant can register in event or workshop.


## API Reference

#### Get all items

```http
  GET http://127.0.0.1:8080
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  GET /api/items/id
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |




## Database Design (Schema)


#### Participant Schema
| Column | Type     |
| :-------- | :------- |
| `id`      | `uuid` |
| `FirstName`      | `string` |
| `LastName`      | `string` |
| `Email`      | `string` |

#### Events Schema
| Column | Type     |
| :-------- | :------- |
| `id`      | `uuid` |
| `Name`      | `string` |
| `description`      | `string` |
| `date`      | `date` |
| `time`      | `string` |
| `provider id`      | `uuid` |

#### Event provider Schema
| Column | Type     |
| :-------- | :------- |
| `id`      | `uuid` |
| `Name`      | `string` |
| `Email`      | `string` |

#### event participant Schema
| Column | Type     |
| :-------- | :------- |
| `event id`      | `uuid` |
| `participant id`      | `uuid` |

## Authors

- [@rahafibrahim21](https://www.github.com/rahafibrahim21)
- [@DevAhlam](https://www.github.com/DevAhlam)
- [@shomokh123](https://www.github.com/shomokh123)


