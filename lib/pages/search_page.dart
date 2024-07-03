import 'package:flutter/material.dart';
import 'package:weather_application_advanced/components/loading_screen.dart';
import 'package:weather_application_advanced/components/search_bar.dart';
import 'package:weather_application_advanced/pages/weather_page.dart';
import 'package:weather_application_advanced/services/cities.dart';
import 'package:weather_application_advanced/settings/preferences.dart';

/// A search page that allows users to search for cities and view their weather information.
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

/// The state of the SearchPage widget.
class _SearchPageState extends State<SearchPage> {
  /// A text controller for the search query.
  final TextEditingController queryController = TextEditingController();

  /// An instance of the CitiesService class, used to fetch cities from the API.
  final CitiesService citiesService = CitiesService();

  /// A list of cities that match the search query.
  List<String> resultCities = [];

  /// A boolean indicating whether the search is in progress.
  bool isLoading = false;

  /// Fetches cities from the API based on the search query.
  ///
  ///
  /// return A Future that completes when the cities are fetched.
  Future<void> _fetchCities(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final citiesFound = await citiesService.fetchCities(query);
      setState(() {
        resultCities = citiesFound;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        resultCities = [];
        isLoading = false;
      });
      throw Exception('Error in loading cities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            // Search bar
            const SizedBox(
              height: 24,
            ),

            ///
            ///A custom search bar that allows users to input their search query.
            ///
            /// Example:
            /// ```
            /// CustomSearchBar(
            ///   hint: 'Search',
            ///   onChanged: _fetchCities,
            ///   controller: queryController,
            /// )
            /// ```
            ///
            CustomSearchBar(
              hint: 'Search',
              onChanged: _fetchCities,
              controller: queryController,
            ),

            // Show list of cities or a loading page
            isLoading
                ?
                // Loading page
                const LoadingScreenWidget()
                :
                // List of cities
                Expanded(
                    child: ListView.builder(
                      itemCount: resultCities.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(resultCities[index]),
                          onTap: () {
                            PreferenceService()
                                .setCityName(resultCities[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WeatherPage(city: resultCities[index]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
