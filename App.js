// نقطة بداية التطبيق: بنحمّل الخط والترجمة، بنعرض شاشة الافتتاح، وبعدين التنقل.
import { useEffect, useState } from 'react';
import { ActivityIndicator, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { StatusBar } from 'expo-status-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { useFonts, Cairo_400Regular, Cairo_600SemiBold, Cairo_700Bold, Cairo_800ExtraBold } from '@expo-google-fonts/cairo';
import { setupI18n } from './src/i18n';
import { AuthProvider } from './src/context/AuthContext';
import AppNavigator from './src/navigation/AppNavigator';
import SplashScreen from './src/screens/SplashScreen';
import { colors } from './src/theme';

export default function App() {
  // useFonts: بيحمّل خط Cairo. fontsLoaded = true لما يخلص.
  const [fontsLoaded] = useFonts({ Cairo_400Regular, Cairo_600SemiBold, Cairo_700Bold, Cairo_800ExtraBold });
  const [i18nReady, setI18nReady] = useState(false); // هل جهزت الترجمة؟
  const [splashDone, setSplashDone] = useState(false); // هل خلصت شاشة الافتتاح؟

  // مرة وحدة لما التطبيق يفتح: بنجهز الترجمة
  useEffect(() => {
    setupI18n().finally(() => setI18nReady(true));
  }, []);

  // لسا ما جهز الخط أو اللغة: دائرة تحميل
  if (!fontsLoaded || !i18nReady) {
    return (
      <View style={{ flex: 1, justifyContent: 'center' }}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  // شاشة الافتتاح (ثانيتين) قبل التطبيق
  if (!splashDone) {
    return (
      <>
        <StatusBar style="light" />
        <SplashScreen onFinish={() => setSplashDone(true)} />
      </>
    );
  }

  return (
    // SafeAreaProvider: بيعرّف مسافات النوتش لكل الشاشات
    <SafeAreaProvider>
      {/* AuthProvider: بيخلي بيانات المستخدم المسجّل متاحة لكل الشاشات */}
      <AuthProvider>
        {/* NavigationContainer: لازم يلف كل التنقل بالتطبيق */}
        <NavigationContainer>
          <StatusBar style="dark" />
          <AppNavigator />
        </NavigationContainer>
      </AuthProvider>
    </SafeAreaProvider>
  );
}
