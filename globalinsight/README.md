# GLOBAL INSIGHT APP

This is a Flutter app that displays the latest news articles and country-related information. The app uses an external API to fetch news articles and country details, allowing users to explore current events and learn more about different countries.

## Development Process

### Chosen API and Its Purpose

- **News API**: The app uses the [News API](https://newsapi.org/) to fetch the latest news articles related to various topics, such as technology. The purpose of using the News API is to provide users with up-to-date information on global events and trends.

- **Restcountries API**: This API is used to fetch details about different countries, including their name, population, area, and capital. It serves as an informational tool, allowing users to explore country-specific details.

### Screens Created and Their Functionalities

1. **News Screen**:
   - Displays a list of the latest news articles.
   - Articles are fetched from the News API and include information such as the title, description, image, source, and publication date.
   - Each article can be tapped to open a dialog with more details, including the full description and an option to read the full article in a browser.
   - Articles are displayed in a card layout, with a "Read More" button for each.

2. **Countries Screen**:
   - Displays a list of countries fetched from the Restcountries API.
   - For each country, the app shows the name, capital, population, and area.
   - Tapping on a country opens a detailed view showing more information about the country.
3. **Home Screen**:
    -Welcomes the user and make them choose what they want to check out.

### Challenges Faced and How They Were Resolved

1. **Handling Null Values in API Responses**:
   - Some data fields in the API responses were missing, which led to issues with displaying null values. To resolve this, I used the `??` operator to provide default values where necessary, such as defaulting to "No Title" for missing article titles and "Unknown Source" for missing news sources.

2. **Handling API Rate Limiting**:
   - The News API has a rate limit on the number of requests that can be made in a certain period. To avoid exceeding the limit during development, I ensured that API calls were made only when the data was not already cached, and I considered implementing a caching strategy for a future update.

3. **State Management**:
   - Managing the state of the app to ensure that the UI updated with the latest news articles was a challenge. This was resolved by using the `setState` method to trigger UI updates after data was fetched from the APIs. The app also handles cases where the data is still loading, displaying a loading indicator until the data is ready.

4. **UI Layout Adjustments**:
   - Ensuring that the UI was responsive and looked good on different screen sizes was challenging. This was addressed by using `Padding`, `SizedBox`, and `ListView.builder` to create a flexible layout that adapts to different screen sizes and orientations.

5. **No Firebase Authentication**:
   - Initially, I considered using Firebase for authentication, but after deciding not to include Firebase in the app, I removed the authentication-related features. This simplified the app and allowed me to focus solely on fetching and displaying data from external APIs.

### Future Improvements

- **Search Functionality**: Allow users to search for news articles or countries based on specific criteria.
- **Caching**: Implement a caching mechanism to store API responses locally and reduce the number of API calls.
- **Error Handling**: Improve error handling for cases when the API is unavailable or the data fetch fails.

## Conclusion

This project allowed me to explore the integration of external APIs in a Flutter app, and I successfully implemented features for displaying news and country details. The challenges I faced were primarily related to managing data from external sources, but they were resolved with proper handling of null values and ensuring that the UI updated correctly when new data was fetched.
