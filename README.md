# Sportovní pes roku - Rails Application

Welcome to **Sportovní pes roku** - a Rails application designed for managing the annual competition of sport dogs within the **Club chovatelů kolií a šeltií** (KCHCS). This application allows club members to sign up their dogs for the competition, track their performance in various competitions throughout the year, and ultimately generate rankings based on specific rules.

## Functionality

- **Member Sign Up**: Only members of **Club chovatelů kolií a šeltií** (KCHCS) are allowed to sign up for the competition. They need to provide their first and last names to verify their membership status and gain access to the application's functionality.

- **Dog Registration**: Once signed up, members can register their dogs within the competition.

- **Competition Tracking**: Members can add details of each competition their dogs participate in, including the type of competition, points earned, and placement.

- **Point Calculation**: The application calculates points earned by each dog based on predefined rules. Points are awarded for completing tests and competitions, both domestically and internationally. 

- **Ranking**: The application provides real-time ranking updates for each dog. Rankings are continuously updated as new entries and competition results are added.


## Competition Rules

### General Rules

- Participation is contingent upon the owner's membership in KCHCS.
  
- Only points earned during the membership period in KCHCS are considered.
  
- A dog may be evaluated in multiple categories.
  
### Pasení (Tracking)

- All tests and competitions held according to the regulations of KJ Brno and official tests and competitions abroad are considered.
  
#### Key

- For tests, points are awarded based on the number of points achieved. Completion of the NHAT test earns 30 points.
  
- For competitions, points are awarded based on performance and placement. Additional points are awarded for defeating teams and placement.

#### Coefficients

<div class="container text-center">
<table class="table table-dark text-center" style="width: 100%;">
<thead>
<tr>
    <th style="width: 50%;">Type</th>
    <th style="width: 50%;">Coefficient (K)</th>
</tr>
</thead>
<tbody>
<tr>
    <td>HWT</td>
    <td>1.0</td>
</tr>
<tr>
    <td>IHT1</td>
    <td>1.5</td>
</tr>
<tr>
    <td>IHT2</td>
    <td>2.0</td>
</tr>
<tr>
    <td>IHT3</td>
    <td>2.5</td>
</tr>
</tbody>
</table>
</div>


#### Placement Points

<div class="container text-center">
<table class="table table-dark text-center" style="width: 100%;">
<thead>
<tr>
    <th style="width: 50%;">Placement</th>
    <th style="width: 50%;">Points</th>
</tr>
</thead>
<tbody>
<tr>
    <td>1st Place</td>
    <td>15</td>
</tr>
<tr>
    <td>2nd Place</td>
    <td>10</td>
</tr>
<tr>
    <td>3rd Place</td>
    <td>5</td>
</tr>
</tbody>
</table>
</div>


Thank you for using Sportovní pes roku! 🐾
