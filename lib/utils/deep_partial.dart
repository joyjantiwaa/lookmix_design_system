/// DeepPartial
/// ทำให้ทุก property ของ T เป็น optional แบบ recursive
/// ใช้สำหรับ data class หรือ Map<String, dynamic> แบบ nested
library;

/// Generic helper สำหรับ Map ที่สามารถเป็น partial
typedef DeepPartialMap = Map<String, dynamic>;

/// ตัวอย่าง function สำหรับ merge default + partial config
/// สามารถนำไปใช้กับ token / theme
DeepPartialMap deepMerge(DeepPartialMap base, DeepPartialMap partial) {
  final result = Map<String, dynamic>.from(base);

  partial.forEach((key, value) {
    if (value is Map<String, dynamic> && result[key] is Map<String, dynamic>) {
      result[key] = deepMerge(result[key] as DeepPartialMap, value);
    } else {
      result[key] = value;
    }
  });

  return result;
}
