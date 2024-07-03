import 'package:flutter/material.dart';
import 'package:weather_application_advanced/components/loading_screen.dart';
import 'package:weather_application_advanced/components/search_bar.dart';
import 'package:weather_application_advanced/pages/weather_page.dart';
import 'package:weather_application_advanced/services/cities.dart';
import 'package:weather_application_advanced/settings/preferences.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController queryController = TextEditingController();
  CitiesService citiesService = CitiesService();
  List<String> resultCities = [];
  bool isLoading = false;

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
            //search bar
            const SizedBox(
              height: 24,
            ),
            CustomSearchBar(
              hint: 'Search',
              onChanged: _fetchCities,
              controller: queryController,
            ),

            //show list of cities or a loaging page
            isLoading
                ?
                //loading page
                const LoadingScreenWidget()
                :
                //list of cities
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
