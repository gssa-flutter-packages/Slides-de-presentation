import 'package:flutter/material.dart';

class ModelDeSlide extends StatefulWidget {
  final int? nombresDeSlides;
  final List<String>? imageDeSlide;
  final List<String>? textDeSlide;
  final double? blocWidth;
  final double? blocHeight;
  final double? arrondissementDuBordDuBloc;
  final List<Color> couleurDuBloc;
  final IconData forwardIcon;
  final IconData backwardIcon;
  final double iconSize;
  final Color iconColor;
  final Alignment forwardIconAlignment;
  final Alignment backwardIconAlignment;
  final IconData? anchorIcon;
  final void Function()? onAnchorPressed;
  final bool showSlideIndicators;
  final String? backgroundImageUrl;

  const ModelDeSlide({
    Key? key,
    required this.nombresDeSlides,
    required this.imageDeSlide,
    required this.textDeSlide,
    this.blocWidth,
    this.blocHeight,
    required this.arrondissementDuBordDuBloc,
    required this.couleurDuBloc,
    this.forwardIcon = Icons.arrow_forward_ios,
    this.backwardIcon = Icons.arrow_back_ios,
    this.iconSize = 24.0,
    this.iconColor = Colors.black,
    this.forwardIconAlignment = Alignment.centerRight,
    this.backwardIconAlignment = Alignment.centerLeft,
    this.anchorIcon,
    this.onAnchorPressed,
    this.showSlideIndicators = true,
    this.backgroundImageUrl,
  }) : super(key: key);

  @override
  State<ModelDeSlide> createState() => _ModelDeSlideState();
}

class _ModelDeSlideState extends State<ModelDeSlide> {
  late PageController _pageController;
  int _currentSlideIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextSlide() {
    if (_currentSlideIndex < widget.nombresDeSlides! - 1) {
      setState(() {
        _currentSlideIndex++;
      });
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AutrePage()),
      );
    }
  }

  void _previousSlide() {
    if (_currentSlideIndex > 0) {
      setState(() {
        _currentSlideIndex--;
      });
      _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            if (widget.backgroundImageUrl != null)
              Positioned.fill(
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.backgroundImageUrl!), // Utilisation de NetworkImage
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
              ),
            Column(
              children: [
                if (widget.showSlideIndicators)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.nombresDeSlides!,
                      (index) => Container(
                        padding: EdgeInsets.only(top: 50),
                        margin: EdgeInsets.all(5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentSlideIndex == index ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.nombresDeSlides,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widget.arrondissementDuBordDuBloc!),
                            color: widget.couleurDuBloc.isNotEmpty ? widget.couleurDuBloc[index] : Colors.amber,
                          ),
                          height: widget.blocHeight ?? MediaQuery.of(context).size.height * 0.6,
                          width: widget.blocWidth ?? MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Image.network(
                                  widget.imageDeSlide![index],
                                  height: widget.blocHeight ?? MediaQuery.of(context).size.height * 0.4,
                                  width: widget.blocWidth ?? MediaQuery.of(context).size.width * 0.65,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    return Text('Failed to load image');
                                  },
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                child: Text(
                                  widget.textDeSlide![index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onPageChanged: (int index) {
                      setState(() {
                        _currentSlideIndex = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(widget.backwardIcon, size: widget.iconSize, color: widget.iconColor),
                      onPressed: _previousSlide,
                    ),
                    IconButton(
                      icon: Icon(widget.forwardIcon, size: widget.iconSize, color: widget.iconColor),
                      onPressed: _nextSlide,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// Page à laquelle vous souhaitez naviguer
class AutrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autre Page'),
      ),
      body: Center(
        child: Text('Vous avez atteint la dernière diapositive !'),
      ),
    );
  }
}
