import React, { useState } from "react";
import {
  BsChevronCompactLeft,
  BsChevronCompactRight,
  BsCurrencyBitcoin,
} from "react-icons/bs";
import { RxDotFilled } from "react-icons/rx";

const slides = [
  {
    url: "https://cdn.dribbble.com/users/303363/screenshots/2390525/open-uri20151206-3-9b3d2s",
  },
  {
    url: "https://tvishacdn.tvisha.com/data/images/2208200917/What_are_the_weather_features.png",
  },
  {
    url: "https://www.hipsthetic.com/wp-content/uploads/2017/11/so-rain.gif",
  },
];

const WelcomePage = ({ currentUser }) => {
  const [currentIndex, setCurrentIndex] = useState(0);

  console.log(currentUser.userData.username);

  const prevSlide = () => {
    const isFirstSlide = currentIndex === 0;
    const newIndex = isFirstSlide ? slides.length - 1 : currentIndex - 1;
    setCurrentIndex(newIndex);
  };

  const nextSlide = () => {
    const isLastSlide = currentIndex === slides.length - 1;
    const newIndex = isLastSlide ? 0 : currentIndex + 1;
    setCurrentIndex(newIndex);
  };

  const goToSlide = (SlideIndex) => {
    setCurrentIndex(SlideIndex);
  };
  return (
    <div className="max-w-screen-xl h-screen w-full m-auto py-16 px-4 relative group">
      <h1 className="text-4xl sm:text-5xl md:text-6xl font-bold text-purple-800 text-center">
        {/* Welcome {currentUser.userData.username} */}
        {/* Welcome{" "}
        {currentUser.userData.username.charAt(0).toUpperCase() +
          currentUser.userData.username.slice(1)}
        , */}
      </h1>
      <br />
      <div
        style={{ backgroundImage: `url(${slides[currentIndex].url})` }}
        className="w-full h-full rounded-2xl bg-center bg-cover duration-500 mx-10"
      ></div>
      {/* Left Arrow */}
      <div className="hidden group-hover:block absolute top-[50%] -translate-x-0 translate-y-[-50%] left-5 text-2xl rounded-full p-2 bg-black/20 text-white cursor-pointer">
        <BsChevronCompactLeft onClick={prevSlide} size={30} />
      </div>
      {/* Right Arrow */}
      <div className="hidden group-hover:block absolute top-[50%] -translate-x-0 translate-y-[-50%] right-5 text-2xl rounded-full p-2 bg-black/20 text-white cursor-pointer">
        <BsChevronCompactRight onClick={nextSlide} size={30} />
      </div>
      <div className="flex top-4 justify-center py-2">
        {slides.map((slideIndex) => (
          <div
            key={slideIndex}
            onClick={() => goToSlide(slideIndex)}
            className="text-2xl cursor-pointer"
          >
            <RxDotFilled />
          </div>
        ))}
      </div>
    </div>
  );
};

export default WelcomePage;
